# テーブル設計

## users テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| nickname             | string     | null: false                    |
| email                | string     | null: false, unique: true      |
| encrypted_password   | string     | null: false                    |

### Association

- has_many :posts
- has_many :comments
- has_many :favorites  
     
## posts テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | -------------------------------|
| title                  | string     | null: false                    |
| text                   | text       | null: false                    |
| genre_id               | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true | 
                                                                          
### Association  
  
- belongs_to :user  
- has_many :comments
- has_many :favorites
     
## comments テーブ  ル 
     
| Column                 | Type       | Options                        |
| ---------------------- | ---------- | -------------------------------|
| text                   | text       | null: false                    |
| post                   | references | null: false, foreign_key: true |
| user                   | references | null: false, foreign_key: true |
     
### Association  
  
- belongs_to :user
- belongs_to :post
  
## favorites テーブル     
     
| Column                 | Type       | Options                        |
| ---------------------- | ---------- | -------------------------------|
| post                   | references | null: false, foreign_key: true |
| user                   | references | null: false, foreign_key: true |
  
### Association  
  
- belongs_to :user  
- belongs_to :post
  