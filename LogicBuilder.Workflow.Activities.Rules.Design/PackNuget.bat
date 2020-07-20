REM To Use update the version number and call: PackNuget
SET "version=1.0.3-preview01"
SET "solutionPath=C:\.NetStandardGit\LogicBuilder\LogicBuilder.Rules"
SET "projectName=LogicBuilder.Workflow.Activities.Rules.Design"
CD /d %0\..


REM dotnet restore %solutionPath%\%projectName%\%projectName%.csproj
msbuild %solutionPath%\%projectName%\%projectName%.csproj -t:restore
msbuild %solutionPath%\%projectName%\%projectName%.csproj /p:Configuration=Release
REM dotnet build %solutionPath%\%projectName%\%projectName%.csproj --configuration Release
nuget pack %solutionPath%\%projectName%\%projectName%.csproj -properties Configuration=Release -OutputDirectory %solutionPath%\%projectName%
nuget add %solutionPath%\%projectName%\%projectName%.%version%.nupkg -source C:\LocalNuget\packages

pause
