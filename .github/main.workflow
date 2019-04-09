workflow "Create deployment logs on GitHub" {
  resolves = [
    "loglify",
  ]
  on = "deployment"
}

action "loglify" {
  uses = "bdougie/loglify@master"
  secrets = ["GITHUB_TOKEN"]
}
