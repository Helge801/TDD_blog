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


end
