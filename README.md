<h1>データベース設計</h1>

<img src="/Users/user/projects/furima-38937/database.png" alt="データベース設計">

<h2>Usersテーブル</h2>
name: :string型<br>
address: :string型<br>
profile: :text型<br>
email: :string型<br>
password: :string型<br>
<h2>itemsテーブル</h2>
item_name: :string型<br>
content: :text型<br>
price: :integer型<br>
user_id: :references型<br>
<h2>ordersテーブル</h2>
user_id: :references型<br>
item_id: :references型<br>
<h2>アソシエーション</h2>
usersとitemsは、1対多(多=items)<br>
usersとordersは、1対多(多=orders)<br>
ordersとitemsは、1対1<br>
