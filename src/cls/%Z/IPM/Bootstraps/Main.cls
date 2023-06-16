Class %Z.IPM.Bootstraps.Main
{

/// Copy _OEX_*.code-snippets files into current namespace's subdirectory of the /_vscode web app's directory (typically <installdir>/.vscode)
ClassMethod InstallSnippets(pSourcePath) As %Status
{
	set sc = $$$OK
    set targetNamespace = $namespace
	new $namespace
	set $namespace = "%SYS"
	set sc = ##class(Security.Applications).Get("/_vscode", .prop)
    if ('$data(prop("Path"), appPath)) {
        return $$$ERROR($$$GeneralError, "/_vscode web app not found")
    }
    set targetPath = ##class(%Library.File).NormalizeDirectory(targetNamespace, appPath_"/")
    if ('##class(%Library.File).CreateDirectoryChain(targetPath)) {
        return $$$ERROR($$$GeneralError, "Failed to create directory "_targetPath)
    }
    set oStmt=##class(%SQL.Statement).%New()
    set sc=oStmt.%PrepareClassQuery("%Library.File","FileSet")
    return:$$$ISERR(sc) sc
    set oResult=oStmt.%Execute(pSourcePath,"_OEX_*.code-snippets")
    while oResult.%Next() {
        set snippetFile = oResult.%Get("Name")
        continue:(snippetFile = "")
        if ('##class(%Library.File).CopyFile(snippetFile, targetPath)) {
            return $$$ERROR($$$GeneralError, "Failed to copy "_snippetFile_" to "_targetPath)
        }
    }
	return sc
}

}
