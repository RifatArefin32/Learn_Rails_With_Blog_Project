class CreateJobPosts < ActiveRecord::Migration[7.2]
  def change
    create_table :job_posts do |t|
      t.string :title
      t.string :organization
      t.string :status
      t.string :salary
      t.string :work_days

      t.timestamps
    end
  end
end
