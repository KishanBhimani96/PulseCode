import requests

def get_github_issues(repo):
    url = f"https://api.github.com/repos/{repo}/issues"
    response = requests.get(url)
    issues = response.json()
    return issues

def get_commit_messages(repo):
    url = f"https://api.github.com/repos/{repo}/commits"
    response = requests.get(url)
    commits = response.json()
    return [commit["commit"]["message"] for commit in commits]

# Example usage
repo = "your_github_username/your_repo_name"
issues = get_github_issues(repo)
commit_messages = get_commit_messages(repo)
