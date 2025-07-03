// Entry point for the build script in your package.json
// app/javascript/application.js

// Hotwire Turbo (Rails newでデフォルトで入っています)
import "@hotwired/turbo-rails"

// Stimulus (Rails newでデフォルトで入っています)
// import "./controllers" // もしStimulusを使うなら。デフォルトでこの行があります。

// BootstrapのJavaScriptをインポート (Popper.jsが先)
import * as Popper from '@popperjs/core'
window.Popper = Popper // BootstrapがグローバルなPopperを期待する場合に必要
import 'bootstrap'

// その他のカスタムJavaScriptファイルもここからインポートできます
// 例: import "./my_custom_script"