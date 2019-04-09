workflow "Create deployment logs on GitHub" {
  on = "deployment"
  resolves = "linter-alex"
}

action "loglify" {
  uses = "bdougie/loglify@master"
  secrets = ["GITHUB_TOKEN"]
}
