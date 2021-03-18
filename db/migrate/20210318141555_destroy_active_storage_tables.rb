class DestroyActiveStorageTables < ActiveRecord::Migration[6.0]
  drop_table :active_storage_attachments
  drop_table :active_storage_blobs
 end
