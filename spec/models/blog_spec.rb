require 'rails_helper'

describe 'creation' do
  before do
    @blog = Blog.create!(title: "blog title",
                         description: "blog description",
                         image: "blog image")
  end

  it 'can be created' do
    expect(@blog).to be_valid
  end

  it 'cannot be created without title' do
    @blog.title = nil
    expect(@blog).to_not be_valid
  end

  it 'cannot be created without description' do
    @blog.description = nil
    expect(@blog).to_not be_valid
  end

  it 'cannot be created without image' do
    @blog.image = nil
    expect(@blog).to_not be_valid
  end
end