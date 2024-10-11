# Learn Ruby on Rails 
- Install Ruby on Rails from [here](https://www.swhosting.com/en/comunidad/manual/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-2204) for Ubuntu.

### Naming Convention

| Name | Description |
|------|-------------|
| Model | BlogPost |
| Model file | blog_post |
| Table Name | blog_posts |
| Controller | BlogPostsController |
| Controller File Name | blog_posts_controller |

## Create a new project  

```bash
rails new blog
```

## Create a Model

Create `BlogPost` model that contains two fields `title` and `body`
```bash
rails generate model BlogPost title:string body:text
```
This command will create:
- `db/migrate/20241009095624_create_blog_posts.rb` migration file
- `app/models/blog_post.rb` BlogPost model
- `test/models/blog_post_test.rb` model's unit test file
- `test/fixtures/blog_posts.yml` YAML file that might be used in a testing context,

## Migrate Database

```bash
rails db:migrate
```
Add `storage/development.sqlite3` to the local server.

## Perform CRUD on Rails Console

Enter into the rails console using the following command:

```bash
rails console
```
| Method | Description |
|---------|-------------|
| BlogPost.all | Gives all records of the `blog_posts` table |
| BlogPost.create(title: "Test Title", body: "This is test body") | Create an object of BlogPost Model |
| BlogPost.find(1) | Gives the record of `blog_posts` table with `id = 1` |
| blog_post.update(title: "Updated Title") | Update the title of `blog_post` object |

## Routes
The routers will be written at `config/routers.rb` file
`get "/blog_posts", to: "blog_posts#index", as: blog_post` Here, `blog_post` is the name of the route. This name can be used as path and url implicitly. 
- blog_post_path(1): `blog_posts/1` 
- blog_post_url(1): `http://localhost:3000/blog_posts/1`

## Create A New Controller
```bash
rails generate controller BlogPosts index --skip-routes # without creating routes
```
- Create `app/controllers/blog_posts_controller.rb` controller
- Create `app/views/blog_posts` directory of all views for blog posts
- Create `app/views/blog_posts/index.html.erb` index view as we mentioned `index` action while creating the controller
- Create `test/controllers/blog_posts_controller_test.rb` file to test the blog_posts controller

## ActiveModel::ForbiddenAttributesError
This error is raised in Ruby on Rails when we're trying to assign mass parameters that haven't been permitted. Rails has strong parameters to prevent mass assignment vulnerabilities, and this error typically occurs when we attempt to pass parameters to a model without explicitly allowing them.

- To resolve this: Permit the parameters explicitly in our controller. For example `params.require(:blog_post).permit(:title, :body)`. Here, `:blog_post` is the `key` and `:title` and `:body` are the attributes which are permitted to do the action. 