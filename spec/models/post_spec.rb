require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    it 'requires a title' do
      p = Post.new
      p.valid?

      expect(p.errors).to have_key(:title)
    end

    it 'requires a title of minimum length of 7' do
      p = Post.new(title: 'abc')
      p.valid?

      expect(p.errors).to have_key(:title)
    end

    it 'requires a body' do
      p = Post.new(title: 'jfkalsfjasklf')
      p.valid?

      expect(p.errors).to have_key(:description)
    end
  end
end
