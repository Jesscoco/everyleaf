# README


## Ruby version
*2.6.5
## Task model
| Column      | Description |
| ----------- | ----------- |
| name      | String        |
| content   | Text          |
| ending_date   | String    |
| status   | String         |
| prority   | String        |
| user_id (FK)   | bigint   |

## User model
| Column      | Description |
| ----------- | ----------- |
| name      | String        |
| email   | String          |
| password   | String    |
| admin   | boolean         |

## Label model
| Column      | Description |
| ----------- | ----------- |
| name      | String        |
| task_id (FK)  | bigint    |

## Deployment on Heroku steps
```bash
$ heroku git:clone -a everyleaf-app21845
$ cd everyleaf-app21845
$ git add .
$ git commit -am "your comment"
$ git push heroku master
```