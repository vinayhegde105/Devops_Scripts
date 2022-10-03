trigger:
- main

pool:
  vmImage: ubuntu-latest

steps: 

- task: DeleteFiles@1
  inputs:
    SourceFolder: '$(System.DefaultWorkingDirectory)'
    Contents: '.git'
    RemoveSourceFolder: true

- task: CopyFilesOverSSH@0
  inputs:
    sshEndpoint: 'test'
    sourceFolder: '$(System.DefaultWorkingDirectory)'
    contents: '**'
    targetFolder: '/var/www/html'
    # cleanTargetFolder: true
    readyTimeout: '20000'
