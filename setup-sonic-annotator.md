# sonic-annotatorのセットアップ

## What
wavファイルをmidiに変換するための環境設定

### sonic-annotator
* wavを扱うcuiツール
* docs: https://code.soundsoftware.ac.uk/projects/sonic-annotator/wiki

### vamp-plugins
* sonic-annotatorがもっと便利になるプラグインの規格

### Silvet Note Transcription
* wav -> midiに変換するためのプラグイン
* vamp-pluginsの一種

## 手順
### ファイルダウンロード&配置
#### sonic-annotator
* https://code.soundsoftware.ac.uk/projects/sonic-annotator/files
* 解凍してパス通っているとこにバイナリを配置

#### Silvet Note Transcription
* https://code.soundsoftware.ac.uk/projects/silvet/files
* 解凍

##### Macの場合
`/Library/Audio/Plug-Ins/Vamp/`にファイルを配置

##### Linuxの場合(未検証)
呼び出し元のRole・Groupによって使い分け
* user: /home/(user)/vamp
* system: /usr/local/lib/vamp

### 実行
```
sonic-annotator file_to_convert.wav -d vamp:silvet:silvet:notes -w midi
```
