// NexHound is a lightweight Linux-first diagnostics toolkit.
package main

import (
	"fmt"
	"os"
	"runtime"
)

var version = "dev"

func main() {
	if err := run(os.Args[1:]); err != nil {
		fmt.Fprintln(os.Stderr, "nexhound:", err)
		os.Exit(2)
	}
}

func run(args []string) error {
	if len(args) == 0 {
		printUsage(os.Stdout)
		return nil
	}

	switch args[0] {
	case "help", "-h", "--help":
		printUsage(os.Stdout)
		return nil
	case "version", "-v", "--version":
		fmt.Printf("nexhound %s (%s/%s)\n", version, runtime.GOOS, runtime.GOARCH)
		return nil
	default:
		return fmt.Errorf("unknown command %q; run 'nexhound help'", args[0])
	}
}

func printUsage(w *os.File) {
	fmt.Fprintln(w, "NexHound — lightweight Linux diagnostics toolkit\n\nUsage:\n  nexhound <command>\n\nCommands:\n  help       Show this help\n  version    Show version and build platform\n\nMore diagnostics will be added through reviewed, tested contributions.")
}
