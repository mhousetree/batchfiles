# batchfiles

制作したバッチファイルのまとめです。  
Windows TerminalでPowerShellを起動して使っています。  
数が増えたら機能別にリポジトリを作った方がいいかな…と思っていますが、今のところはまとめてあります。

## できること
### "lazy\*\*\*.bat"
#### 共通
gitとリモートリポジトリ関連のコマンドをまとめて実行します。  
現在いるブランチを自動で取得し、そこにデプロイするようになっています。  
終了時には通知音が鳴ります(cloneするだけでは鳴らず、任意のwavファイルを指定する必要があります)。
#### lazygit.bat
```
git add .
git commit
git push origin BranchName
```
これらのコマンドをまとめて実行します。
#### lazyheroku.bat
lazygitで実行するコマンドに加え、
```
git push heroku BranchName
```
も実行します。  

## ディレクトリ構成
- lazygit.bat
- lazyheroku.bat
- play_sounds
  - files  
  ここに通知音として使用したいwavファイルを配置します。
  - play_sound.ps1  
  lazy\*\*\*.batで音を鳴らすために使っているPowerShellスクリプトです。  
  通知音として使用したいファイルをここで指定します。
  - command.bat  
  バッチファイル内でplay_sound.ps1を呼び出すためのコードです。  
  直接このバッチファイルを呼び出すというよりは、内容をコピーして音を鳴らす部分を  
  流用したいときに使います。  
  lazyorigin、lazyherokuでもこのコードをコピーして使っています。
  
