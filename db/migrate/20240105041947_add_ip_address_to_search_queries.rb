class AddIpAddressToSearchQueries < ActiveRecord::Migration[7.0]
  def change
    add_column :search_queries, :ip_address, :string
  end
end
