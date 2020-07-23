class Customers::CartsController < ApplicationController

before_action :setup_cart_item!, only: [:create, :update, :delete]
