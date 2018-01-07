require 'rails_helper'

describe 'navigation' do

  describe 'index' do

    before do
      visit blogs_path
    end

    it 'can be visited' do
      expect(page.status_code).to eq(200)
    end

    it 'has title of blogs' do
      expect(page).to have_content(/Blogs/)
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
