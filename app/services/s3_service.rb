class S3Service < Aws::S3::Resource
  def list_buckets
    self.buckets.each do |bucket|
      p bucket.name
    end
    nil  
  end

end