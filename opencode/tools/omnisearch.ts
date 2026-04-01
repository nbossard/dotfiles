import { tool } from "../node_modules/@opencode-ai/plugin/dist/tool"
// ce fichier a été linké via un lien dur dans le dossier ~/.config/opencode/tools/ 
// ln ~/dotfiles/opencode/tools/omnisearch.ts  omnisearch.ts
// Le lien symbolique ne fonctionne pas.

export default tool({
  description: "Search in Obsidian vault using Omnisearch API. Returns search results as JSON array with path, score, vault, basename, foundWords, matches, and excerpt for each result.",
  args: {
    query: tool.schema.string().describe("Search query (e.g., 'elastic rennes', 'intégrateur', 'CEOP7310')"),
    limit: tool.schema.number().optional().default(10).describe("Maximum number of results to return (default: 10, max: 50)")
  },
  async execute(args) {
    try {
      const encodedQuery = encodeURIComponent(args.query)
      const response = await fetch(
        `http://localhost:51361/search?q=${encodedQuery}`
      )

      if (!response.ok) {
        throw new Error(`HTTP ${response.status}: ${response.statusText}`)
      }

      const results = await response.json()

      // Limiter les résultats
      const limitedResults = results.slice(0, args.limit)

      // Retourner le JSON tel quel
      return JSON.stringify(limitedResults, null, 2)

    } catch (error) {
      if (error.code === 'ECONNREFUSED') {
        return "Error: Obsidian Omnisearch API not reachable on port 51361. Make sure Obsidian is running with the Omnisearch plugin."
      }
      throw error
    }
  }
})
