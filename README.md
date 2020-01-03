# GICOFについて
## URL
https://gicof.site/

## コンセプト
ゲームが好きな人向けのマッチングアプリ<br>
→ゲームが好きで、オンラインゲームもするがオフ会などの敷居は高いと考えている<br>
→ゲームを通じて友人を作りたいが、ゲーム内で自分からチャットなど出来ない人<br>
→twitterなどで、同じゲームを好きな人をうまく探せない人<br>
→自発的にアクションを起こして人と仲良くなるのが苦手な人<br>
→不特定多数に個人情報に近いことを知られるのは少し嫌<br>
と私自身が感じたのでこれを解消できるアプリを作りたいと考えました。<br>

## 開発環境
言語：　ruby 2.5.5 <br>
フレームワーク:　rails 5.2.4<br>
バージョン管理:　git<br>
DB:　mysql2、sqlite3<br>
インフラ:　AWS<br>

## 実装した機能
管理者機能<br>
-ユーザー一覧機能<br>
-ユーザー詳細確認機能<br>
-ユーザー退会機能<br>
-ゲーム種類追加・削除機能<br>

ユーザー機能<br>
-ユーザー登録機能<br>
-ログイン機能<br>
-ユーザー情報編集機能<br>
-投稿機能<br>
-DM機能<br>
-マッチング機能<br>
-未読機能<br>
-ページネーション機能<br>
-自動スクロール機能<br>
-予定登録機能<br>
-マッチング解除機能(ブロック機能)<br>
-退会機能<br>

その他機能<br>
-テスト(Rspec)<br>
-リファクタリング(rubocop)<br>
