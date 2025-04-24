# Customer Contact System README (客戶聯繫系統說明文件)

## Purpose / 目的
This Delphi application, defined by `Unit1.pas` and `Unit1.dfm`, implements a Customer Contact System to view and manage customer information, including email addresses and phone numbers. It connects to a MySQL database (`testdb`) and provides a graphical user interface (GUI) for data interaction.

此 Delphi 應用程式由 `Unit1.pas` 和 `Unit1.dfm` 定義，實現了一個客戶聯繫系統，用於查看和管理客戶資訊，包括電子郵件地址和電話號碼。該應用程式連接到 MySQL 資料庫 (`testdb`)，並提供圖形化使用者介面 (GUI) 以進行資料交互。

## Functionality / 功能
The application provides the following features:

該應用程式提供以下功能：

1. **Customer Data Display / Figure / 客戶資料顯示**:
   - A grid (`DBGrid1`) displays a list of customers with `Customer ID`, `Email`, and `Phone` fields.
   - 頂部網格 (`DBGrid1`) 顯示客戶列表，包括 `客戶編號`、`電子郵件` 和 `電話` 欄位。

2. **Tabbed Contact Details / 標籤式聯繫詳情**:
   - A `PageControl` with two tabs:
     - **Emails Tab**: Displays a grid (`DBGrid2`) showing email addresses for the selected customer.
     - **Phones Tab**: Displays a grid (`DBGrid3`) showing phone numbers for the selected customer.
   - 包含兩個標籤的 `PageControl`：
     - **電子郵件標籤**：顯示網格 (`DBGrid2`)，展示選定客戶的電子郵件地址。
     - **電話標籤**：顯示網格 (`DBGrid3`)，展示選定客戶的電話號碼。

3. **Navigation / 導航**:
   - Each grid is paired with a `DBNavigator` (`DBNavigator1`, `DBNavigator2`, `DBNavigator3`) for browsing, editing, and deleting records.
   - 每個網格配有 `DBNavigator`（`DBNavigator1`、`DBNavigator2`、`DBNavigator3`），用於瀏覽、編輯和刪除記錄。

4. **Database Integration / 資料庫整合**:
   - Connects to a MySQL database (`testdb`) on `localhost` using `MyConnection1`.
   - Retrieves customer data using `MyQuery1` (`SELECT * FROM customers`).
   - Retrieves email and phone details using `MyQuery2` and `MyQuery3`, filtered by customer ID and contact type (`Email` or `Telephone`).
   - 使用 `MyConnection1` 連接到 `localhost` 上的 MySQL 資料庫 (`testdb`)。
   - 使用 `MyQuery1` 檢索客戶資料（`SELECT * FROM customers`）。
   - 使用 `MyQuery2` 和 `MyQuery3` 檢索電子郵件和電話詳情，根據客戶編號和聯繫類型（`Email` 或 `Telephone`）進行篩選。

5. **Dynamic Tab Visibility / 動態標籤可見性**:
   - Only the active tab’s grid and navigator are visible, controlled by the `UpdateTabVisibility` procedure.
   - 僅活躍標籤的網格和導航器可見，由 `UpdateTabVisibility` 程序控制。

## Files / 文件
- **Unit1.dfm**: Defines the visual layout of the main form (`Form1`), including grids, tabs, navigators, and database components.
- **Unit1.pas**: Contains Pascal code for logic, including database connection, query setup, and tab visibility management.

- **Unit1.dfm**：定義主表單 (`Form1`) 的視覺佈局，包括網格、標籤、導航器和資料庫組件。
- **Unit1.pas**：包含 Pascal 程式碼，用於邏輯處理，包括資料庫連接、查詢設置和標籤可見性管理。

## Database Schema / 資料庫結構
Assumes the following structure in `testdb`:

假設 `testdb` 中具有以下結構：

- **customers** table / 客戶表:
  - `id` (integer, primary key / 整數，主鍵)
  - `email` (varchar/string / 字串)
  - `telephone` (varchar/string / 字串)
- **contact_details** table / 聯繫詳情表:
  - `customer_id` (integer, foreign key referencing `customers.id` / 整數，參考 `customers.id` 的外鍵)
  - `contact_type` (varchar/string, e.g., `Email` or `Telephone` / 字串，例如 `Email` 或 `Telephone`)
  - `contact_value` (varchar/string, stores email or phone / 字串，儲存電子郵件或電話)

## Prerequisites / 先決條件
- **Delphi Environment**: Built with Embarcadero Delphi using VCL components.
- **MySQL Database**:
  - MySQL server on `localhost` (port 3306).
  - Database: `testdb`.
  - Credentials: Username `root`, password `p#x]m[n7R$=35*48!qE%rv`.
  - Required tables: `customers` and `contact_details`.
- **MySQL Connector**: Requires `libmysql.dll` or compatible library.
- **Dependencies**: Units listed in `Unit1.pas` (e.g., `Winapi.Windows`, `Vcl.Controls`).

- **Delphi 環境**：使用 Embarcadero Delphi 和 VCL 組件構建。
- **MySQL 資料庫**：
  - 在 `localhost` 上運行的 MySQL 伺服器（端口 3306）。
  - 資料庫：`testdb`。
  - 憑證：用戶名 `root`，密碼 `p#x]m[n7R$=35*48!qE%rv`。
  - 所需表：`customers` 和 `contact_details`。
- **MySQL 連接器**：需要 `libmysql.dll` 或相容庫。
- **依賴項**：`Unit1.pas` 中列出的單元（例如 `Winapi.Windows`、`Vcl.Controls`）。

## Usage / 使用方法
1. **Setup Database / 設置資料庫**:
   - Create `testdb` in MySQL and populate `customers` and `contact_details` tables.
   - Example SQL:
     ```sql
     CREATE TABLE customers (
         id INT PRIMARY KEY,
         email VARCHAR(255),
         telephone VARCHAR(50)
     );

     CREATE TABLE contact_details (
         customer_id INT,
         contact_type VARCHAR(50),
         contact_value VARCHAR(255),
         FOREIGN KEY (customer_id) REFERENCES customers(id)
     );
     ```
   - 在 MySQL 中創建 `testdb` 並填充 `customers` 和 `contact_details` 表。
   - 示例 SQL：
     ```sql
     CREATE TABLE customers (
         id INT PRIMARY KEY,
         email VARCHAR(255),
         telephone VARCHAR(50)
     );

     CREATE TABLE contact_details (
         customer_id INT,
         contact_type VARCHAR(50),
         contact_value VARCHAR(255),
         FOREIGN KEY (customer_id) REFERENCES customers(id)
     );
     ```

2. **Configure Application / 配置應用程式**:
   - Ensure MySQL server is running and credentials in `Unit1.pas` are correct.
   - 確保 MySQL 伺服器正在運行，且 `Unit1.pas` 中的憑證正確。

3. **Run the Application / 運行應用程式**:
   - Open the project in Delphi, compile, and run.
   - The form displays customer data with tabs for emails and phones.
   - 在 Delphi 中打開項目，編譯並運行。
   - 表單顯示客戶資料，包含電子郵件和電話的標籤。

4. **Interact with the GUI / 與 GUI 交互**:
   - Use `DBNavigator1` to browse/edit customers.
   - Switch between `Emails` and `Phones` tabs.
   - Use `DBNavigator2` and `DBNavigator3` for email/phone records.
   - 使用 `DBNavigator1` 瀏覽/編輯客戶。
   - 在 `Emails` 和 `Phones` 標籤之間切換。
   - 使用 `DBNavigator2` 和 `DBNavigator3` 管理電子郵件/電話記錄。

## Notes / 注意事項
- **Security / 安全性**: Password is hardcoded in `Unit1.pas`. Use secure storage (e.g., environment variables) for production.
- **Error Handling / 錯誤處理**: Shows message box for connection errors. Enhance for production if needed.
- **Performance / 效能**: Queries use `SELECT *`. Optimize by selecting specific fields for large datasets.
- **Tab Visibility / 標籤可見性**: `UpdateTabVisibility` ensures only active tab components are visible.
- **Encrypted Password / 加密密碼**: `Unit1.dfm` includes encrypted password; actual password set in `Unit1.pas`.

- **安全性**：密碼在 `Unit1.pas` 中硬編碼。生產環境中應使用安全儲存（例如環境變數）。
- **錯誤處理**：顯示連接錯誤的訊息框。根據需要增強生產環境的錯誤處理。
- **效能**：查詢使用 `SELECT *`。對於大型資料集，應選擇特定欄位以優化。
- **標籤可見性**：`UpdateTabVisibility` 確保僅活躍標籤的組件可見。
- **加密密碼**：`Unit1.dfm` 包含加密密碼；實際密碼在 `Unit1.pas` 中設置。

## Troubleshooting / 故障排除
- **Database Connection Errors / 資料庫連接錯誤**:
  - Verify MySQL server is running on `localhost:3306`.
  - Check credentials and table existence.
  - 驗證 MySQL 伺服器在 `localhost:3306` 上運行。
  - 檢查憑證和表是否存在。
- **Data Not Displaying / 資料未顯示**:
  - Ensure queries are active (`Active = True`) and data exists in tables.
  - 確保查詢已啟動（`Active = True`）且表中存在資料。
- **Component Errors / 組件錯誤**:
  - Confirm all required Delphi units and MySQL connector are installed.
  - 確認已安裝所有所需的 Delphi 單元和 MySQL 連接器。

For assistance, refer to Delphi or MySQL documentation or contact the repository administrator.

如需幫助，請參閱 Delphi 或 MySQL 文件，或聯繫儲存庫管理員。