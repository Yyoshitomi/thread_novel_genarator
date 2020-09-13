# frozen_string_literal: true

class HelloWorldController < ApplicationController

  def index
    @hello_world_props = { name: "Stranger" }
  end

  def test
  end
end
