require 'rails_helper'

RSpec.describe Project, type: :model do
  describe "validations" do
    it "requires a title" do
      p = Project.new title: nil
      p.valid?
      expect(p.errors).to have_key(:title)
    end

    it "requires a unique title" do
      Project.create(title: "abc")
      project = Project.new(title: "abc")
      project.valid?
      expect(project.errors).to have_key(:title)
    end

    it "requires a date greater then today's date" do
      Project.create(due_date: "2016-06-27")
      project = Project.new(due_date: "2016-05-26")
      project.valid?
      expect(project.errors).to have_key(:due_date)
    end

  end
end
