class S3Service < Aws::S3::Resource
  def list_buckets
    bucket_list = []
    self.buckets.each do |bucket|
      bucket_list << bucket.name
    end
    bucket_list
  end

  def upload_file_to_existent_bucket(bucket,folder,file_path)
    if bucket_exists?(bucket)
      key = "#{folder}/#{File.basename(file_path)}"
      obj = self.bucket(bucket).object(key)
      if obj.upload_file(file_path)
        return "succesfully uploaded"
      else 
        return "cannot upload file"
      end
    else
      return "bucket not found"
    end    
  end

  # private
  def bucket_exists?(bucket)
    self.list_buckets.include? bucket  
  end

end