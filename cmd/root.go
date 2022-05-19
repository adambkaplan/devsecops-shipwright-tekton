package cmd

import (
	"fmt"

	"github.com/adambkaplan/devsecops-shipwright-tekton/pkg/hello"
	"github.com/spf13/cobra"
)

// cobra root command
var rootCmd = &cobra.Command{
	Use:   "hello",
	Short: "A simple \"Hello world!\" command line application.",
	Long: "A simple \"Hello world!\" command line application, used to demonstrate how to create a" +
		" secure software supply chain with Shipwright and Tekton",
	Run: runHello,
}

func Execute() error {
	return rootCmd.Execute()
}

func runHello(cmd *cobra.Command, args []string) {
	fmt.Println(hello.SayHello())
}
