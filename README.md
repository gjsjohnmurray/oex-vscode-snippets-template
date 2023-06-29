# oex-vscode-snippets-template
Template for a repository that will publish [VS Code snippet files](https://code.visualstudio.com/docs/editor/userdefinedsnippets) in an IPM package, typically via [https://openexchange.intersystems.com](https://openexchange.intersystems.com/). 

## How To Use This Template

### Create a new repository from the template

Go to [https://github.com/gjsjohnmurray/oex-vscode-snippets-template](https://github.com/gjsjohnmurray/oex-vscode-snippets-template) and click the `Use this template` button to create a new repository within your GitHub account.

To learn more about this step, visit [GitHub Docs](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template).

### Clone your new repository locally
1. Launch VS Code.
2. If your last-used workspace or folder opened automatically, close this.
3. Go to Source Control view.
4. Click the `Clone Repository` button there.
5. Either paste the URL of your new GitHub repository, or press Enter and then search for it by typing part of its name.
6. Choose a local folder into which you want the repository cloned.
7. When prompted, open the cloned repository.
8. Ignore the notification about opening a workspace file named `_oex-vscode-snippets-template.code-workspace`.
9. If prompted to install recommended extensions, do that.

### Rename the sample snippets file
The `src/snippets` folder contains a file named `_OEX_John.Murray_exampleInTemplate.code-snippets` which you should rename using its context menu so it contains your Developer Community handle in place of mine (`John.Murray`).

> If you're not sure what your handle is, go to [your DC profile](https://community.intersystems.com/user) and look on the upper right panel. Your handle displays after the `@` sign, which you shouldn't include in your filename.

This naming convention will allow published snippets from multiple authors to coexist in a VS Code project workspace where they get installed. The `_OEX_` prefix is required for all snippet files being published on Open Exchange using this mechanism.

### Start the IRIS container
The repository defines a Docker container for running an IRIS instance where you can try out the snippets you create. Start this now:

1. Choose `Compose Up` from the context menu of the `docker-compose.yml` file.
2. Wait for the Terminal output to complete with the message `Terminal will be reused by tasks, press any key to close it.`.
3. Focus on it and press any key.

### Rename the workspace file, then open it
1. In Explorer view use the context menu of the `_oex-vscode-snippets-template.code-workspace` file and rename it to match your repository name. We recommend keeping the `_` prefix so that the file lists next to the dotfiles in Explorer view.
2. Click on the renamed file to open it, then use the `Open Workspace` button in its lower right corner.

The workspace has two root folders:

- `Project` contains the locally-cloned folders and files of the repository you created from the template. You will **create** your snippets here, but indirectly (see details below).
- `IRIS Server (test your snippets here)` is where you will **try** your snippets by writing code in the USER namespace of the IRIS instance started above.

Before you can access the IRIS Server you must refresh the connection to it. 

1. Click on the `ObjectScript` panel on the status bar.
2. In the quickpick that appears top-centre of your window choose `Refresh Connection` if available, else `Toggle Connection`.

After a few seconds the status bar panel should change to report being connected to the USER namespace of a localhost IRIS port, but its hover tip may still report a problem such as "socket hang up". Solve this by running `Developer: Reload Window` from Command Palette. When that completes, use `Toggle Connection` again from the status bar panel.

To complete the refresh, open your `_XYZ.code-workspace` file, change the `"IRIS Server (test your snippets here)"` folder label slightly (for example to  `"IRIS Server (test my snippets here)"`), and save it. This is necessary to make VS Code discover snippet files for that IRIS-hosted folder.

> The above refresh steps, including the label edit, will be required each time you subsequently open your _XYZ.code-workspace file in VS Code.

### Write and test your snippets
As you saw earlier when renaming the example snippets file, the snippets you write are stored in the `src/snippets` folder of the `Project` root. However in order for your development changes to be detected by VS Code you should **always** open these files for editing via the `Snippets: Configure User Snippets` command.

That command's quickpick will initially offer you the example snippets file you renamed earlier, for example `_OEX_Jane.Doe_exampleInTemplate.code-snippets`. Pick this.

Ultimately you may decide to delete this sample file, or at least change the `exampleInTemplate` portion of its name to reflect what its edited contents actually do.

As an alternative to adapting the example file, create a new one. Here's how:

1. Run the `Snippets: Configure User Snippets` command.
2. In the quickpick filter, type `IRIS` to easily get to the entry beginning `New Snippets file for 'IRIS Server (...)'`. .Pick it.
3. When prompted for the file name, follow the naming convention including the `_OEX_` prefix. Omit the `.code-snippets` suffix.
> For example: `_OEX_Jane.Doe_loops` if you are writing a set of snippets for creating loop code.
4. Replace VS Code's standard template for a new snippets file with ours by running the command `Snippets: Fill File with Snippet`, then choosing `New Snippets File`.
5. Tab through the placeholders to change them, or edit the initial contents directly.

To verify how your snippets will behave when used while writing code, create new test classes or routines under the `IRIS Server` folder, then trigger snippet insertions using the standard VS Code mechanisms.

> **IMPORTANT NOTE:** The classes and routines you write in this folder are only stored inside the database of the USER namespace in the Docker container instance of IRIS. They will **not** persist across a container restart.

### Publish your snippets as an IPM / ZPM package on Open Exchange

1. Open the `module.xml` file in the `Project` root.
2. Edit the `name` attribute of its `<Document>` tag to become the name of the Open Exchange package you will publish. The recommended convention is `vscode-snippets-`_`yourId`_`-`_`suffix`_ where _yourid_ is your Developer Community handle and _suffix_ is whatever you choose to distinguish this published snippets module from others you create. The suffix isn't necessarily the same as the suffix you used in the snippets filename because one package can contain multiple snippet files.
3. Make the same change in the `<Name>` sub-section of `<Module>`.
3. Edit `README.md` to remove these template instructions and replace them with your own content. Please retain a reference to the template repository from which you created yours.
4. Edit `LICENSE` to credit yourself with the snippets. Please also credit me as the author of the framework.
5. Edit `CHANGELOG.md` appropriately.
6. Use VS Code's Source Control view to stage, commit and push your changes to your GitHub repository. Expect to only see changes to the files mentioned above plus your `src/snippets/_OEX_*` files. Please do not publish any `_OEX_John.Murray_*` files.

Now publish on Open Exchange by pointing to your GitHub repository URL and setting the `Publish in Package Manager` checkbox. See [this DC article](https://community.intersystems.com/post/objectscript-package-auto-publishing-now-available-open-exchange) for more details, or consult [Open Exchange documentation](https://docs.openexchange.intersystems.com/solutions/submit/).

People who want to use your snippets will be able to install the package by issuing the appropriate `zpm` command in their IRIS namespace. Your snippets will then be available to them when they are using the InterSystems ObjectScript extension's [server-side editing](https://intersystems-community.github.io/vscode-objectscript/serverside/) features in that namespace. To use the snippets in client-side editing, locate the directory that the `/_vscode` web application of the IRIS server points to. The packaged .code-snippets file(s) will be in a subdirectory whose name matches the namespace into which the package was installed.
