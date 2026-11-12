# 水耕栽培管理システム

スマートフォンで「どの植物があり、現在どのような状態か」を確認する個人開発・学習プロジェクトです。主要な実装は開発者自身が行います。今回はGo/Flutterの開発基盤だけを作成しました。製品の画面、Pot DTO/Entity/BLoC、通信、API、Handler、Service/UseCase、Repository、DBアクセスは未実装です。

## v0.1スコープ・想定画面

鉢一覧は植物名、鉢ID、現在状態、最終更新時刻を表示します。大量のセンサー値を並べず、確認が必要な鉢を見つけやすくし、選択すると詳細へ遷移します。

詳細の上部にも同じ基本情報を表示します。周辺環境は気温・湿度・照度、養液は水温・水位・水量を表示予定です。履歴データを保存しますが、履歴グラフはv0.1対象外です。

鉢の状態は単一のNORMAL / WARNINGではなく、該当する状態コードの配列`conditions`で表します。例：`["WATER_LEVEL_LOW", "WATER_TEMPERATURE_LOW"]`。問題がない場合は空配列とします。状態判定ルールとしきい値は後で決めます。通信のOFFLINE状態は栽培上の状態と分ける案です。

## システム構成・技術スタック

```text
ESP32（将来） → Go Backend API → DB（未選定）
                       ↑
                Flutter Mobile App
```

一つのGitリポジトリで管理し、専用のモノレポ管理ツールは導入しません。Goは標準ツールから始め、フレームワークやDBドライバーは必要時に選びます。FlutterはBLoC、Freezed、JSON生成、Dioを採用します。

## モノレポ構成

```text
backend/
  go.mod                 # module hydroponics/backend
  .env.example           # 設定雛形。読み込みは未実装
  cmd/api/               # 将来の入口。現在は空
  internal/config/       # 将来の設定読み込み。現在は空
mobile/
  android/ ios/          # Flutter標準生成
  lib/main.dart          # 空の起動画面
  lib/codegen_sample/    # 製品から独立した生成検証サンプル
  test/                  # 生成コードの動作検証
firmware/                # 将来ESP32を配置
docs/                    # 必要になった設計資料
```

リポジトリにはGo BackendとFlutterアプリの基盤を置きます。設計資料が必要になった段階でdocs/を追加します。

## Backend開発環境

Go 1.26以上をインストールしてください。この作業環境ではGoがPATH上に見つからず、Goの検証は未実施です。依存なしのmoduleなのでgo.sumはありません。公開リポジトリ決定時にmodule名を実際のURLに変更してください。

```powershell
cd backend
Copy-Item .env.example .env
go version
```

.envは自動で読み込みません。将来、環境変数の読み込みと検証を実装します。HTTP_ADDRはローカル開発用の案です。ソース実装後は以下を使用します。

```sh
go fmt ./...
go vet ./...
go test ./...
go run ./cmd/api
```

現在はGoソースがなく、go runは実行できません。DBが未選定なのでDocker ComposeやDBサービスを追加していません。Handler/Service/Repositoryの多層構造は先に作らず、必要なファイルをinternal配下へ追加します。

## Flutter開発環境

作成環境はFlutter **3.47.5 stable / Dart 3.13.4**。Android/iOSを対象にflutter create --emptyで作成しました。pubspec.yamlとpubspec.lockをGit管理します。組織IDは仮のcom.exampleです。配布前にapplicationIdとbundle identifierを決め直してください。

```sh
cd mobile
flutter --version
flutter doctor
flutter pub get
dart run build_runner build
flutter analyze
flutter test
flutter devices
flutter run
```

AndroidはSDK、ライセンス、実機またはエミュレーターが必要です。iOSビルドはmacOSとXcodeが必要です。ネイティブビルドと実機起動は今回未検証です。

mobile/.env.exampleは説明用です。dotenvを導入せず、自動読み込みもしません。API設定実装時はString.fromEnvironment('API_BASE_URL')等と `flutter run --dart-define=API_BASE_URL=http://10.0.2.2:8080` を使う案です。現在は参照しません。10.0.2.2はAndroid標準エミュレーター用で、実機はPCのLANアドレス等を使用します。ローカルHTTP許可とTLSは対象環境に合わせて決めます。秘密情報はアプリに埋め込みません。

## Flutterアーキテクチャ

feature単位を基本に、その中で責務を小さく分けます。全体をpresentation/domain/dataに分けるより関連変更がまとまり、厳密なClean Architectureより階層を抑えられます。以下は将来の提案で、製品ファイルは作成していません。

```text
lib/
  main.dart
  app/                       # 設定・ルート（必要時）
  features/pots/
    bloc/                    # Event、State、手書きBLoC
    view/                    # 一覧・詳細・専用Widget
    models/                  # Entity/Domain Model
    data/
      dto/                   # API表現とJSON変換
      mappers/               # 意味的変換
      pot_repository.dart
  core/                      # 複数featureで共有が必要なものだけ
```

Repositoryのinterface、UseCase、DIコンテナーは必須にしません。まず具体クラスをコンストラクターで渡し、複数データソースやテスト等で必要になれば分離します。空の三層や汎用クラスを大量に作りません。

## 採用パッケージと理由

| パッケージ（解決済みバージョン） | 目的 |
| --- | --- |
| flutter_bloc 9.1.1 | BLoCとWidgetの連携 |
| freezed_annotation 3.1.0 / freezed 4.0.2（dev） | immutable class、copyWith、equality、sealed Event/State |
| json_annotation 4.12.0 / json_serializable 6.14.1（dev） | DTOのJSON変換 |
| build_runner 2.16.1（dev） | generatorの実行と監視 |
| dio 5.11.1 | 将来のHTTP通信。現在は未使用 |
| flutter_lints 6.0.0（dev） | 基本lint |
| flutter_test（SDK） | 生成検証テスト |

アノテーションは通常依存、generatorは開発依存です。DioはHTTP方針を揃えるために導入し、API Clientは未実装です。

retrofit / retrofit_generatorは見送ります。少数のAPIではDio直接利用の手書き量が少なく、生成工程と宣言を増やす必要性が低いためです。retrofitはAPI宣言から通信の定型コードを生成できるため、API数と重複が増えたら導入を検討します。

変換専用パッケージは意味的変換を明示したいため見送り、EquatableはFreezedと機能が重複するため追加しません。Riverpod / GetX / Providerを状態管理として採用しません。ただしflutter_blocの内部依存としてproviderがlockfileに含まれます。

公式資料：[flutter_bloc](https://pub.dev/packages/flutter_bloc)、[Freezed](https://pub.dev/packages/freezed)、[json_serializable](https://pub.dev/packages/json_serializable)、[build_runner](https://pub.dev/packages/build_runner)、[Dio](https://pub.dev/packages/dio)、[retrofit](https://pub.dev/packages/retrofit)。バージョン互換性はこのSDKでの依存解決と検証に基づきます。

## BLoC / Freezed / DTO・Entityの責務

BLoCのEvent Handler、Repository呼び出し、State遷移は人間が書きます。BlocBuilderで表示し、BlocListenerで一度だけの副作用を扱う方針です。FreezedはEvent/Stateの形を生成し、処理は生成しません。sealedの分岐にはDartのswitchパターンを使用します。

DTOはAPIのキー名・型・null許容に合わせJSON変換を生成します。Entity/Domain Modelはアプリ内の意味・単位・不変条件を表します。必要なモデルだけFreezedにし、単純なenumやクラスまで一律に生成しません。EntityのJSON変換は必須ではありません。

```text
API JSON → DTO → Entity/Domain Model → BLoC → UI
```

DTO → Entityはfeature内のextensionまたは小さなmapper関数を手書きします。単位変換、日時、欠測、未知conditionsコードなどの意味を明示してテストします。コンストラクター、copyWith、equality等は生成しますが、変換専用パッケージは追加しません。

## build_runner・コード生成の運用

build_runnerはFreezedとjson_serializable等のbuilderを実行します。.freezed.dartは不変データ・unionの実装、.g.dartはfromJson/toJsonです。BLoC処理、UI、Repository、意味的mapperは生成対象ではありません。以下はmobile内で実行します。

```sh
dart run build_runner build
dart run build_runner watch
```

watchは保存時に再生成し、Ctrl+Cで終了します。この環境ではAOTビルドの一時ファイル書き込みが失敗するため、検証済みの次のJITコマンドを使用してください（原因は未特定です）。

```sh
dart run build_runner build --force-jit
dart run build_runner watch --force-jit
```

生成先の名前に手書きファイルを置かないでください。競合時はGit差分を確認し、元ソースに変更を反映してから再生成します。以前よく使われた`--delete-conflicting-outputs`は採用したbuild_runner 2.16.1では削除済みの互換用オプションなので、解決方法として依存しません。キャッシュ不整合時はwatchを止め、`dart run build_runner clean`後にJITでbuildを実行します。Gitのマージ競合は元のDartソースを解決して再生成します。

生成ファイルとpubspec.lockはGit管理します。生成結果をレビューでき、checkout直後も型を解決できるためです。直接編集せず、元ソース変更 → 生成 → `dart format lib test` → `flutter analyze` → `flutter test` → 元ソースと生成結果を一緒にcommit、を基本とします。.dart_toolとbuildはGit管理しません。

lib/codegen_sample/sample.dartは検証専用のSampleDto/Event/Stateで、main.dartから参照しません。テストはJSON往復、copyWith、equality、sealed分岐を確認します。不要になればサンプルのソース、2つの生成ファイル、対応テストをまとめて削除できます。

### この環境での検証結果

- 依存解決、JITでのコード生成、Dart整形は成功。
- `dart analyze`はNo issues found、`flutter test`は1テスト成功。
- `flutter analyze`は解析サーバー内部のJSON読み取りエラーで停止。原因は未特定で、上記Dart解析で代替確認しました。
- Goは未導入（PATH上にない）ため未検証。Android/iOSのビルドと実機起動も未検証。

## 想定API（未実装）

| Method / Path | 用途 |
| --- | --- |
| GET /api/v1/pots | 鉢一覧の概要 |
| GET /api/v1/pots/{potId} | 基本情報と最新計測値 |
| POST /api/v1/pots/{potId}/measurements | 計測履歴の追加（主にデバイス側） |

認証、エラー、ページング、重複送信対策は未決定です。鉢IDの具体的な形式とMobileが履歴追加APIを呼ぶかも未決定です。以下は実装前のJSON案です。

一覧は鉢ID、植物名、状態コード配列、最終計測時刻を返します。

```json
[
  {
    "id": "pot-id",
    "plant_name": "スイートバジル",
    "conditions": [],
    "measured_at": "2026-11-13T09:30:00Z"
  }
]
```

詳細は基本情報と最新計測値を返します。サンプル値は形式の説明用です。

```json
{
  "id": "pot-id",
  "plant_name": "スイートバジル",
  "conditions": ["WATER_LEVEL_LOW", "WATER_TEMPERATURE_LOW"],
  "latest_measurement": {
    "temperature_c": 16.0,
    "humidity_percent": 30.0,
    "illuminance_lux": 200.0,
    "water_temperature_c": 15.0,
    "water_level_mm": 30.0,
    "water_volume_l": 3.3,
    "measured_at": "2026-11-13T09:30:00Z"
  }
}
```

`conditions`の値は数値ではなく文字列コードとし、GoとFlutterそれぞれでEnum相当の型に対応付けます。問題がなければ空配列です。水位低下・水温低下など複数の状態が同時に起きることを表現できます。Flutter側でコードを日本語表示に変換します。コード名と判定しきい値は実装時に確定します。

## 想定データモデル（設計案）

| モデル | 項目 |
| --- | --- |
| Pot | id、plantName、conditions |
| Measurement | potId、measuredAt、receivedAt、temperatureC、humidityPercent、illuminanceLux、waterTemperatureC、waterLevelMm、waterVolumeL |

計測は履歴として保存し、詳細には最新値を返す予定です。画面の「最終計測時刻」にはセンサーが測定した`measuredAt`を表示します。Backendが受信した時刻`receivedAt`も通信遅延や再送の調査用に保存する案です。どちらもタイムゾーン付きISO 8601形式（例：`2026-11-13T09:30:00Z`）を使います。植物はスイートバジルとミントを想定します。温度°C、湿度%、照度lux、水位mm、水量Lは仮の単位で、センサー仕様に合わせて確定します。欠測を0と同一視せずnull等で扱います。照度luxとPPFDは別の測定量です。

## 最初のTODO

1. API JSON契約、ID形式、単位・null・日時・未知conditionsコードの扱いを決める。
2. DBと履歴保存方法、鉢状態のルールを決める。
3. Goの入口と設定読み込みを作り、GET一覧から実装する。
4. Pot DTO/Modelとmapperを作り、生成・変換テストを行う。
5. Dioと小さなRepository、通信エラー処理を実装する。
6. Pot BLoCの処理とState遷移、一覧・詳細UIを順に作る。
7. 計測登録、履歴保存、デバイス接続を実装する。

## 未決定事項

- DB、デプロイ先、Goフレームワーク、公開module名。
- APIスキーマ、エラー、ID形式、精度、単位、時刻/タイムゾーン、部分計測。
- 状態判定場所、しきい値、OFFLINEの時間、異常の優先順位。
- デバイス認証、計測間隔、再送と重複排除。
- 本番API URL、HTTP/TLS、applicationId/bundle ID。
- 再取得頻度、オフライン表示とキャッシュ。
- CI、最低対応OS、配布手段。

## 将来構想・今回の対象外

pH、EC、PPFD、DLI、溶存酸素の追加や、AI/画像解析による成長速度低下、水温/養液異常、摘心推奨、収穫時期接近、病害可能性の判定を将来検討します。

ログイン、ユーザー管理、Push通知/設定、履歴グラフ、カメラ、画像解析のアプリ統合、AI、自動給水、自動液肥投入、自動照明制御は今回実装しません。必要になった段階で仕様を決めます。
