# oex-vscode-snippets-template
Template for a repository that will publish VS Code snippet files in an IPM package, typically via https://openexchange.intersystems.com 

## How To Use This Template

### Create a new repository from the template

Go to https://github.com/gjsjohnmurray/oex-vscode-snippets-template and click the 'Use this template' button to create a new repository within your GitHub account.

To learn more about this step, visit [GitHub Docs](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template).

### Clone your new repository locally
1. Launch VS Code.
2. If your last-used workspace or folder opened automatically, close this.
3. Go to Source Control view.
4. Click the `Clone Repository` button there.
5. Either paste the URL of your new GitHub repository, or press Enter and then search for it by typing part of its name.
6. Choose a local folder into which you want the repository cloned.
7. When prompted, open the cloned repository.
8. Dismiss the notification about opening a workspace file named `_oex-vscode-snippets-template.code-workspace`.

### Adapt the contents provided by the template
1. In Explorer view use the context menu of the `_oex-vscode-snippets-template.code-workspace file` to rename it to match your repository name. We recommend keeping the `_` prefix so the file lists next to the dotfiles in Explorer view.
2. Click on the renamed file to open it, then use the `Open Workspace` button in its lower right corner.
3. In the `src/snippets` folder of the `Project` root, rename the example snippets file `_OEX_John.Murray_exampleInTemplate.code-snippets` to use your InterSystems Developer Community 'handle' instead of `John.Murray` (mine). This naming convention allows snippets from multiple authors to coexist in VS Code project workspaces where they get installed.
