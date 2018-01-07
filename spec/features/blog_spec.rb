require 'rails_helper'

describe 'navigation' do

  describe 'index' do

    before do
    @blog = Blog.create!(title: "index_blog",
                         description: "blog description",
                         image: Faker::LoremPixel.image("600x300"))
    @blog2 = Blog.create!(title: "second_index_blog",
                         description: "blog description",
                         image: Faker::LoremPixel.image("600x300"))
      visit blogs_path
    end

    it 'can be visited' do
      expect(page.status_code).to eq(200)
    end

    it 'has blogs displayed' do
      expect(page).to have_content(/index_blog|second_index_blog/)
    end

    it 'has a link to each view blog' do
      click_on("#{@blog.id}_show_link")
      expect(page).to have_content(/index_blog/)
      expect(page).to_not have_content(/second_index_blog/)
    end
  end

  describe 'new' do
      
    before do
      visit new_blog_path
    end

    it 'can be visited' do
      expect(page.status_code).to eq(200)
    end

    it 'has title New Blog' do
      expect(page).to have_content(/New Blog/)
    end
  end

  describe 'show' do
    before do
    @blog = Blog.create!(title: "af1g2h4b5h4h6k7jb4h",
                         description: "9d6778d69f786g978g98ad",
                         image: Faker::LoremPixel.image("600x300"))
    @blog.post.create!(body: "66c8c76d76g9s59")
    @blog.post.create!(body: "77da58d587asdf87a6f")

    visit blog_path(@blog)
    end

    it 'can be visited' do
      expect(page.status_code).to eq(200)
    end

    it 'has blog title' do
      expect(page).to have_content(/af1g2h4b5h4h6k7jb4h/)
    end

    it 'has blog description' do
      expect(page).to have_content(/9d6778d69f786g978g98ad/)
    end

    it 'has accociated posts displayed' do
      expect(page).to have_content(/66c8c76d76g9s59|77da58d587asdf87a6f/)
    end


  end


end
