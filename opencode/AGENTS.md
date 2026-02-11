# AGENTS

This is Agents.md but GLOBAL, it applies to ALL projects.

## Information about human user knownledge and interest

### Tools I use

I prefer command line (terminal) tools.

I like using following tools:

- wezterm (most of my day i work in wezterm with multiple tabs open)
- neovim (the editor I use 99% of time. I use very rarely vscode)
- makefile
- jq (to manipulate json)
- markdown (all the doc in code is written in markdown, I also use it for my Personnal knowledge Base)
- yazi (a terminal file manager)
- jujutsu (aka "jj") in addition to git, so don't panic is we are in detached state, this is normal.

I prefer installing tools using homebrew.

I like bash scripts, I hate python scripts.

### continuous learning

I am a senior developer, but I always want to learn.
So you should insert in answers, when useful, blocks with contextual knowledge.

Example :
- if I tell you to "use TDD principle and start by writing test that should fail"
  And you are answering talking about "red phase" you could add a quick explanation about "red phase"
- if you are proposing various solutions based on different design patterns, include a quick reminder of these design patterns

## Working Method

### Systematic Reading of Local AGENTS.md Files

Before working in any subdirectory (doc/RFC/, doc/ADR/, schema/, etc.), you MUST:
1. Check if an AGENTS.md file exists in that directory
2. Read it immediately
3. Apply its specific guidelines
4. NEVER ask questions whose answers are in it

Examples: doc/RFC/AGENTS.md, doc/ADR/AGENTS.md, schema/AGENTS.md

## LIMITATIONS

### GIT usage limitations

VERY IMPORTANT. YOU ARE NEVER ALLOWED TO GIT COMMIT EVEN IN BUILD MODE, NEITHER GIT ADD.
THIS IS MY WORK AND ONLY FOR ME.

Commands git FORBIDDEN :
- git add
- git commit
- git push
- git stash
- git rebase
- git revert
- git reset
- any other command changing index or history

Commands git ALLOWED (only read) :
- git status
- git diff
- git log
- git show
- git branch (lecture)
