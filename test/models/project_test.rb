require "test_helper"

feature Project do
  scenario "includes name in to_param" do
    project = Project.create!(name: "Hello World")
    project.to_param.must_equal "#{product.id}-hello-world"
  end
end
