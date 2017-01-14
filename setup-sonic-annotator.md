# sonic-annotatorのセットアップ

## What
wavファイルをmidiに変換するための環境設定

### sonic-annotator
* wavを扱うcuiツール
* docs: https://code.soundsoftware.ac.uk/projects/sonic-annotator/wiki

### vamp-plugins
* sonic-annotatorがもっと便利になるプラグインの規格

### wav -> midi変換プラグイン
* vamp-pluginsの一種
* 試してみたもプラグイン
  * Silvet Note Transcription
  * QM Vamp Plugins
  * UA Vamp Plugins

## 手順
### ファイルダウンロード&配置
#### sonic-annotator
* https://code.soundsoftware.ac.uk/projects/sonic-annotator/files
* 解凍してパス通っているとこにバイナリを配置
* Silvet Note Transcription: https://code.soundsoftware.ac.uk/projects/silvet/files
* QM Vamp Plugins: https://code.soundsoftware.ac.uk/projects/qm-vamp-plugins/files
* UA Vamp Plugins: http://grfia.dlsi.ua.es/cm/projects/drims/softwareVAMP.php

##### Macの場合
`/Library/Audio/Plug-Ins/Vamp/`にファイルを配置

##### Linuxの場合(未検証)
呼び出し元のRole・Groupによって使い分け
* user: /home/(user)/vamp
* system: /usr/local/lib/vamp

### 実行
```
sonic-annotator [変換するファイル] -d [vamp-pluginの名前] -w midi
```
* vamp-pluginの名前
  * vamp:silvet:silvet:notes
  * vamp:qm-vamp-plugins:qm-transcription:transcription
  * vamp:ua-vamp-plugins:mf0ua:mf0ua
