require 'pry'
class RecipesController < ApplicationController

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :"recipes/edit"
  end

  get '/recipes/:id/delete' do
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    erb :"recipes/delete"
  end

  get '/recipes/new' do
    erb :"recipes/new"
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :"recipes/recipe"
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect "recipes/#{@recipe.id}"
  end


  delete '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    redirect "recipes/#{@recipe.id}/delete"
  end

  get '/recipes' do
    erb :"recipes/index"
  end

  post '/recipes' do
    # binding.pry
    @recipe = Recipe.create(params)
    redirect "/recipes/#{@recipe.id}"
  end

end
