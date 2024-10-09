# Learn Ruby on Rails 
- Install Ruby on Rails from [here](https://www.swhosting.com/en/comunidad/manual/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-2204) for Ubuntu.
-
## Create new project  

```bash
rails new blog`
```

# Create model in rails

Create `BlogPost` model that contains two fields `title` and `body`
```bash
rails generate model BlogPost title:string body:text
```
This command will create:
- `db/migrate/20241009095624_create_blog_posts.rb` migration file
- `app/models/blog_post.rb` BlogPost model
- `test/models/blog_post_test.rb` model's unit test file
- `test/fixtures/blog_posts.yml` YAML file that might be used in a testing context,
