class CreateAuthorDashboards < ActiveRecord::Migration[7.1]
  def change
    create_table :author_dashboards do |t|

      t.timestamps
    end
  end
end
