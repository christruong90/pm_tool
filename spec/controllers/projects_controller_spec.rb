require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  # let(:project) { FactoryGirl.create(:project) }
  def project
    @project ||= Project.create({title: "Chris", description: "Smith",
                    due_date: "2016-09-27"})
  end


  describe "#new" do
    it "renders a new template" do
      get :new
      expect(response).to render_template(:new)
    end

    it "instantiates a new project instance variable" do
      get :new
      expect(assigns(:project)).to be_a_new(Project)
    end
  end

  describe "#create" do
    context "with valid attributes" do
      def valid_request
        p = Project.create({title: "John", description: "Smith",
                        due_date: "2016-09-27"})
      end

      it "saves a record to the database" do
          count_before = Project.count
          valid_request
          count_after  = Project.count
          expect(count_after).to eq(count_before + 1)
      end
    end
  end

  describe "#show" do
    # the `before` defines a block that gets executed before every example
    before do
      get :show, id: project.id
    end

    it "renders the show template" do
      expect(response).to render_template(:show)
    end

    it "sets an instance variable to the project with the passed id" do
      expect(assigns(:project)).to eq(project)
    end

  end

  describe "#index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end

    it "sets `projects` instance variable to all campaigns in the DB" do
      project_1 = FactoryGirl.create({title: "John", description: "Smith",
                      due_date: "2016-09-27"})
      project_2 = FactoryGirl.create({title: "Chris", description: "Smith",
                      due_date: "2016-09-27"})
      get :index
      expect(assigns(:projects)).to eq([project_1, project_2])
    end
  end

end
