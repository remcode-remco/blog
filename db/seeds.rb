require 'faker'
require 'open-uri'

# Create users
3.times do |n|
  user = User.create!(
    provider: "provider_#{n}",
    uid: "uid_#{n}",
    name: "User #{n + 1}",
    email: "user#{n + 1}@example.com",
    image: "https://example.com/image#{n + 1}.png",
    blocked: false,
    admin: false
  )

  # Create posts for each user
  5.times do |m|
    post = user.posts.create!(
      title: "Post #{m + 1} by #{user.name}",
      view_counter: 1,
      content: "This is the content of Post #{m + 1} by #{user.name}."
    )

    # Create sources for each post
    2.times do |k|
      post.sources.create!(
        url: "https://example.com/source#{k + 1}_for_post#{m + 1}.html",
        title: "Source #{k + 1} for Post #{m + 1} by #{user.name}",
        position: k + 1
      )
    end

    # Create videos for each post
    2.times do |l|
      post.videos.create!(
        url: "https://example.com/video#{l + 1}_for_post#{m + 1}.mp4",
        title: "Video #{l + 1} for Post #{m + 1} by #{user.name}",
        position: l + 1
      )
    end

    1.times do |l|
      file = URI.open('https://thispersondoesnotexist.com')
      post.images.attach(io: file, filename: 'user.png', content_type: 'image/png')
    end
  end
end
