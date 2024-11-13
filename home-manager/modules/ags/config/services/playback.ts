interface Sink {
  sinkName: string;
  sinkNick: string;
  sinkActive: boolean;
  sinkId: string;
}

class AudioService extends Service {
  static {
    Service.register(
      this,
      {
        "sink-changed": ["boolean"],
      },
      {
        sinks: ["jsobject", "r"],
      }
    );
  }

  #sinks: Sink[] = this.#getSinks();

  get sinks() {
    return this.#sinks;
  }

  constructor() {
    super();

    Utils.interval(1000, () => {
      const newSinks = this.#getSinks();
      if (JSON.stringify(newSinks) !== JSON.stringify(this.#sinks)) {
        this.#sinks = newSinks;
        this.changed("sinks");

        //@ts-ignore
        this.emit("sink-changed", true);
      }
    });
  }

  updateSinks() {
    const newSinks = this.#getSinks();
    if (JSON.stringify(newSinks) !== JSON.stringify(this.#sinks)) {
      this.#sinks = newSinks;
      this.changed("sinks");

      //@ts-ignore
      this.emit("sink-changed", true);
    }
  }

  #splitNodes(pwNodes: string): string[] {
    // Regular expression to match each node block
    const nodePattern = /id \d+, type PipeWire:Interface:Node\/3[\s\S]+?(?=(?:\n\tid \d+, type PipeWire:Interface:Node\/3)|$)/g;

    // Use matchAll to find all matches
    const matches = [...pwNodes.matchAll(nodePattern)];

    // Extract the full matched strings and trim any leading/trailing whitespace
    return matches.map((match) => match[0].trim());
  }

  #getSinks(): Sink[] {
    const pwNodesRaw = Utils.exec("pw-cli list-objects Node");
    const pactlActiveSink = Utils.exec("wpctl status | grep Audio/Sink");
    const sinks: Sink[] = [];
    const nodes = this.#splitNodes(pwNodesRaw);

    nodes.forEach((block) => {
      const lines = block.split("\n");
      let sinkName = "";
      let sinkNick = "";
      let sinkDescription = "";
      let sinkId = "";
      let isSink = false;

      lines.forEach((line) => {
        const trimmedLine = line.trim();
        if (trimmedLine.startsWith("node.name =")) {
          sinkName = trimmedLine.split("=")[1].trim().replace(/"/g, "");
        }
        if (trimmedLine.startsWith("node.nick =")) {
          sinkNick = trimmedLine.split("=")[1].trim().replace(/"/g, "");
        }
        if (trimmedLine.startsWith("node.description =")) {
          sinkDescription = trimmedLine.split("=")[1].trim().replace(/"/g, "");
        }
        if (trimmedLine.startsWith("id ")) {
          sinkId = trimmedLine.split(" ")[1].trim().replace(/"/g, "").replace(",", "");
        }
        if (trimmedLine.includes("media.class") && trimmedLine.includes("Sink")) {
          isSink = true;
        }
      });

      if (isSink && sinkName.includes("alsa_output.pci")) {
        sinks.push({
          sinkName: sinkName,
          sinkNick: sinkNick || sinkDescription,
          sinkActive: pactlActiveSink.includes(sinkName),
          sinkId: sinkId,
        });
      }
    });

    return sinks;
  }
}

const playback = new AudioService();

export default playback;
