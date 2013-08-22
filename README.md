# Ember Pagination

Simple library to do ember pagination. Works with servers using the will_paginate API.

### Including in your project

Just include dist/ember-pagination.js in your project after including Ember and Ember Data.

Ember Pagination is also available as an npm module

### How to Use

Just change your adapter from DS.RESTAdapter to Em.PaginationAdapter

    App.Store = DS.Store.extend
      revision: 11
      adapter: 'Em.PaginationAdapter'

A showMore method is automatically added to Ember.ArrayController. 

In your template, put something like this to load the next page:

    <a href="#" {{action showMore}}>Show More</a>

Example Rails Controller:

    # App must include WillPaginate and ActiveModelSerializers
    class PostsController < ApplicationController
      def index
        page = (params[:page] || 1).to_i
        @posts = Post.all.paginate(:page => page, :per_page => 5)
        render :json => @posts, :meta => {:total_pages => @posts.total_pages, :page => page}
      end
    end