package com.nixmash.cloud.core.dto;

import com.nixmash.cloud.core.enums.PostDisplayType;
import com.nixmash.cloud.core.enums.PostType;
import com.nixmash.cloud.core.enums.TwitterCardType;
import com.nixmash.cloud.core.model.Post;
import com.nixmash.cloud.core.model.User;
import com.nixmash.cloud.core.utils.MultipartPostImage;
import com.nixmash.cloud.core.utils.PostUtils;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.time.ZonedDateTime;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import static org.apache.commons.lang3.StringUtils.substring;


public class PostDTO implements Serializable {

    private static final long serialVersionUID = 3533657789336113957L;
    public static final String ALPHACODE_09 = "09";

    @NotEmpty
    private Set<TagDTO> tags = new HashSet<TagDTO>();

    @NotEmpty
    @Length(max = Post.MAX_POST_TITLE_LENGTH)
    private String postTitle;

    @NotEmpty
    @Length(min = Post.MIN_POST_CONTENT_LENGTH)
    private String postContent;

    @NotNull
    private PostDisplayType displayType;

    @NotNull
    private TwitterCardType twitterCardType;

    // region Private Properties

    private Long postId;
    private Long userId;

    private String postName;
    private String postLink;
    private String postImage;
    private ZonedDateTime postDate;
    private ZonedDateTime postModified;
    private PostType postType;

    private Boolean isPublished = true;
    private String postSource = "NA";
    private int clickCount = 0;
    private int likesCount = 0;
    private int valueRating = 0;
    private int version = 0;

    private Boolean hasImages = false;
    private int imageIndex = 1;
    private String alphaKey;
    private Long temporaryPostId = 1L;

    private Long categoryId = 1L;

    private List<MultipartPostImage> postImages;

    private User author;

    // endregion

    // region getter setters


    public TwitterCardType getTwitterCardType() {
        return twitterCardType;
    }
    public void setTwitterCardType(TwitterCardType twitterCardType) {
        this.twitterCardType = twitterCardType;
    }

    public Long getCategoryId() {
        return categoryId;
    }
    public void setCategoryId(Long categoryId) {
        this.categoryId = categoryId;
    }

    public User getAuthor() {
        return author;
    }
    public void setAuthor(User author) {
        this.author = author;
    }

    public Long getTemporaryPostId() {
        return temporaryPostId;
    }
    public void setTemporaryPostId(Long temporaryPostId) {
        this.temporaryPostId = temporaryPostId;
    }

    public List<MultipartPostImage> getPostImages() {
        return postImages;
    }
    public void setPostImages(List<MultipartPostImage> postImages) {
        this.postImages = postImages;
    }

    public Set<TagDTO> getTags() {
        return tags;
    }
    public void setTags(Set<TagDTO> tags) {
        this.tags = tags;
    }

    public int getImageIndex() {
        return imageIndex;
    }
    public void setImageIndex(int imageIndex) {
        this.imageIndex = imageIndex;
    }

    public Long getPostId() {
        return postId;
    }
    public void setPostId(Long postId) {
        this.postId = postId;
    }

    public Long getUserId() {
        return userId;
    }
    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getPostTitle() {
        return postTitle;
    }
    public void setPostTitle(String postTitle) {
        this.postTitle = postTitle;
    }

    public String getPostName() {
        return postName;
    }
    public void setPostName(String postName) {
        this.postName = postName;
    }

    public String getPostLink() {
        return postLink;
    }
    public void setPostLink(String postLink) {
        this.postLink = postLink;
    }

    public ZonedDateTime getPostDate() {
        return postDate;
    }
    public void setPostDate(ZonedDateTime postDate) {
        this.postDate = postDate;
    }

    public ZonedDateTime getPostModified() {
        return postModified;
    }
    public void setPostModified(ZonedDateTime postModified) {
        this.postModified = postModified;
    }

    public PostType getPostType() {
        return postType;
    }
    public void setPostType(PostType postType) {
        this.postType = postType;
    }

    public PostDisplayType getDisplayType() {
        return displayType;
    }
    public void setDisplayType(PostDisplayType displayType) {
        this.displayType = displayType;
    }

    public Boolean getIsPublished() {
        return isPublished;
    }
    public void setIsPublished(Boolean isPublished) {
        this.isPublished = isPublished;
    }

    public String getPostContent() {
        return postContent;
    }
    public void setPostContent(String postContent) {
        this.postContent = postContent;
    }

    public String getPostSource() {
        return postSource;
    }
    public void setPostSource(String postSource) {
        this.postSource = postSource;
    }

    public String getPostImage() {
        return postImage;
    }
    public void setPostImage(String postImage) {
        this.postImage = postImage;
    }

    public int getClickCount() {
        return clickCount;
    }
    public void setClickCount(int clickCount) {
        this.clickCount = clickCount;
    }

    public int getLikesCount() {
        return likesCount;
    }
    public void setLikesCount(int likesCount) {
        this.likesCount = likesCount;
    }

    public int getValueRating() {
        return valueRating;
    }
    public void setValueRating(int valueRating) {
        this.valueRating = valueRating;
    }

    public int getVersion() {
        return version;
    }
    public void setVersion(int version) {
        this.version = version;
    }

    public Boolean getHasImages() {
        return hasImages;
    }
    public void setHasImages(Boolean hasImages) {
        this.hasImages = hasImages;
    }

    public String getAlphaKey() {
        return alphaKey;
    }
    public void setAlphaKey(String alphaKey) {
        this.alphaKey = alphaKey;
    }

    // endregion

    // region methods

    public String authorFullname() {
        return this.author.getFirstName() + " " + this.author.getLastName();
    }
    public boolean isLink() { return  (this.getPostType().equals(PostType.LINK));}
    public boolean isNew() {
        return (this.postId == null);
    }

    // endregion

    // region ToString()

    @Override
    public String toString() {
        return "Post{" +
                "postId=" + postId +
                ", userId=" + userId +
                ", postTitle='" + postTitle + '\'' +
                ", postName='" + postName + '\'' +
                ", postLink='" + postLink + '\'' +
                ", postDate=" + postDate +
                ", postModified=" + postModified +
                ", postType='" + postType + '\'' +
                ", displayType='" + displayType + '\'' +
                ", isPublished=" + isPublished +
                ", postContent='" + postContent + '\'' +
                ", postSource='" + postSource + '\'' +
                ", clickCount=" + clickCount +
                ", likesCount=" + likesCount +
                ", valueRating=" + valueRating +
                ", categoryId =" + categoryId +
                ", version=" + version +
                '}';
    }

    // endregion

    // region Builders

    public static Builder getBuilder(Long userId, String postTitle, String postName, String postLink, String postContent, PostType postType, PostDisplayType displayType, Long categoryId, TwitterCardType twitterCardType) {
        return new PostDTO.Builder(userId, postTitle, postName, postLink, postContent, postType, displayType, categoryId, twitterCardType);
    }

    public static Builder getUpdateFields(Long postId,
                                          String postTitle,
                                          String postContent,
                                          Boolean isPublished,
                                          PostDisplayType displayType,
                                          Long categoryId,
                                          TwitterCardType twitterCardType) {
        return new PostDTO.Builder(postId, postTitle, postContent, isPublished, displayType, categoryId, twitterCardType);
    }


    public static PostDTO buildAlphaTitles(Post post) {
        return populateAlphas(post, true);

    }

    public static PostDTO buildAlphaNumericTitles(Post post) {
        return populateAlphas(post, false);
    }

    private static PostDTO populateAlphas(Post post, Boolean isAlphabetic) {
        PostDTO built = new PostDTO();
        String postTitle = post.getPostTitle();
        String alphaKey = StringUtils.upperCase(substring(postTitle, 0, 1));
        if (!isAlphabetic) {
            alphaKey = ALPHACODE_09;
        }

        built.postTitle = postTitle;
        built.postName = post.getPostName();
        built.alphaKey = alphaKey;
        return built;
    }

    public static class Builder {

        private PostDTO built;

        public Builder(Long userId, String postTitle, String postName, String postLink, String postContent, PostType postType, PostDisplayType displayType, Long categoryId, TwitterCardType twitterCardType) {
            built = new PostDTO();
            built.userId = userId;
            built.postTitle = postTitle;
            built.postName = postName;
            built.postLink = postLink;
            built.postContent = postContent;
            built.postType = postType;
            built.displayType = displayType;
            built.categoryId = categoryId;
            built.twitterCardType = twitterCardType;
            built.postSource = PostUtils.createPostSource(postLink);
        }

        public Builder(Long postId,
                       String postTitle,
                       String postContent,
                       Boolean isPublished,
                       PostDisplayType displayType,
                       Long categoryId, TwitterCardType twitterCardType) {
            built = new PostDTO();
            built.postId = postId;
            built.postTitle = postTitle;
            built.postContent = postContent;
            built.isPublished = isPublished;
            built.displayType = displayType;
            built.categoryId = categoryId;
            built.twitterCardType = twitterCardType;
        }

        public Builder postImage(String postImage) {
            built.postImage = postImage;
            return this;
        }

        public Builder hasImages(Boolean hasImages) {
            built.hasImages = hasImages;
            return this;
        }

        public Builder isPublished(Boolean isPublished) {
            built.setIsPublished(isPublished);
            return this;
        }

        public Builder postSource(String postSource) {
            built.postSource = postSource;
            return this;
        }

        public Builder postId(Long postId) {
            built.postId = postId;
            return this;
        }

        public Builder tags(Set<TagDTO> tagDTOs) {
            built.tags = tagDTOs;
            return this;
        }

        public PostDTO build() {
            return built;
        }
    }

    // endregion

}
