# README

## user テーブル

| Column             | Type    | Options                |
| ----------------   | ------  | ---------------------  |
| name               | string  | NOT NULL               |
| email              | string  | NOT NULL, unique: true | 
| encrypted_password | string  | NOT NULL               | 

### Association
- has_many :targets



## target テーブル

| Column       | Type       | Options            |
| -----------  | ---------- | -----------------  |
| title        | string     | NOT NULL           |
| genre_id     | string     |                    |
| deadline     | date       | NOT NULL           |
| plan         | text       | NOT NULL           |
| great_man    | string     | NOT NULL           |
| future       | text       | NOT NULL           |
| user         | references | foreign_key: true  |

### Association
- belongs_to :user