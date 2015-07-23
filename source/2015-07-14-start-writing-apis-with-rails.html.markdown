---
title: start-writing-apis-with-rails
date: 2015-07-14 15:29 UTC
tags: api, rails, json
category: rails
layout: post-layout
---
# Start writing API's in Rails

With the popularity of Javascript frameworks and the move to cross
platform development, Now is a good time to start writing your
green-field applications with an API first mindset. 

Rails 5 has been announce to have a new `--api` flag included for your
disposal, but this functionality has been around for over a year in
the [rails-api](https://github.com/rails-api/rails-api) gem. 

The idea of building a Rails API is to remove the unneeded magic that is
not needed when rendering just JSON. You also gain the ability to be
flexible in choose which how you want to render your front-end and
whether or not you want to build an iOS and/or Android app with the same
database.

## Getting Started
Setting up the rails-api globally requires you to use the `gem` command instead of the `bundle` command you would normally use in a project. 

```
$ gem install rails-api
$ rails-api new my-api
```

## Create your model
```
$ rails g scaffold movie title:string rating:string
$ bundle exec rake db:migrate
$ rails s
$ open http://localhost:3000/movies
# You should see an empty array.
```
![empty table](http://i.imgur.com/lMLnZdkm.png)
## Add the data using Faker
```
Gemfile

# ...
gem 'faker'
#...
```
```
$ bundle install
```
```
# db/seeds.rb

20.times do
  Movie.create(
    title: Faker::Lorem.words.join(' '),
    rating: ['NC17', 'R', 'PG13', 'PG', 'G'].sample
  )
end
```
```
$ bundle exec rake db:seed
```
Now revisit `http://localhost:3000/movies` and you will see you movies.

![populate movies](http://i.imgur.com/Vkaxwmcl.png)
## Create your serializer

Now that is out of the way you can began creating all your
models and serializers using the rails generators provided. These
generators give you a quick way to get you test, controllers, and
serializers. To take advantage of serializers you will need to install
[ActiveModelSerializers](https://www.youtube.com/watch?v=G6ipU6AiEXY).

```
Gemfile

# ...
gem 'faker'
gem 'active_model_serializers', '~> 0.8.3'
#...
```

```
$ bundle install
```

A specific version number needs to be specified in the Gemfile due to some release candidates not being backwards compatible ([more on that issue](https://github.com/rails-api/active_model_serializers)).


Serializers are separate from your models, think of them similar to how
you whitelist attributes in the `attr` reader and writer of your model or [strong params](https://www.youtube.com/watch?v=MKTIig3v_H0) in your controllers. 

Only the models and attributes that have been serialized will be render
publicly to JSON. I recommend installing the
[JSONView](https://chrome.google.com/webstore/detail/jsonview/chklaanhfefbnpoihckbnefhakgolnmc?hl=en) plugin to view JSON with more readability in the browser. 


```
$ rails g serializer Movie title rating
```
You will now notice when you refresh the page the `created_at` and `updated_at` are no longer
there. This is because they were not white listed in the serializer. You
will also notice the table is now serialized with the name `movies` as
well. This is part of the new [json-api](http://jsonapi.org/) conventions. 

![serialized movies](http://i.imgur.com/GKDkFwPl.png)

You can add or delete white listed attributes in the
`serializers/movie_seriliazer.rb`.

Add the director method to the serializer and white list the attribute
director. 

```
# serializer/movie_serializer.rb

class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :rating, :director

  def director
    Faker::Name.name
  end
end
 ```
If you notice every time you refresh your api, the director's name
changes. It is more ideal to add this new attribute and method to your model 
to persist to the database, but some methods that require live and
changing data on refresh can more realistically store in the serializer.

![movies with directors](http://i.imgur.com/q9VDgj6l.png)

## Enabling CORS 
Enabling [CORS](https://en.wikipedia.org/wiki/Cross-origin_resource_sharing) is a way to grant access to your API to other sources, without opening
up this access, your rails app will prevent any
JS frameworks or clients from seeing any portion of your API. 

This was a step that I had to learn the hard way, but am giving to you
for free. Please take to the time study up on [securing your REST API the
right way](https://stormpath.com/blog/secure-your-rest-api-right-way/)
and [making your api RESTful](https://www.airpair.com/ruby-on-rails/posts/building-a-restful-api-in-a-rails-application). Rails has built security to prevent other malicious access, so only enable CORS when necessary.

I recommend the [rack-cors gem](https://github.com/cyu/rack-cors) for
accomplishing this.

```
Gemfile

# ...
gem 'faker'
gem 'active_model_serializers', '~> 0.8.3'
gem 'rack-cors'
#...
```
```
$ bundle install
```
```
# config/application.rb

module MyApi
  class Application < Rails::Application

    # ...

    config.middleware.insert_before 0, "Rack::Cors" do
      allow do
        origins '*'
        resource '*', :headers => :any, :methods => [:get, :post, :options]
      end
    end

  end
end
```
## Bonus
Your api is ready to be consumed by your mobile and client apps. It is also worth taking a look at [Web Tokens in a JS Frontend](http://zacstewart.com/2015/05/14/using-json-web-tokens-to-authenticate-javascript-front-ends-on-rails.html) 
if you plan on adding authentication to your application.

