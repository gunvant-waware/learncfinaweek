
export const GetLikeButton = (props) => {
   return (
      <div className="like-wrapper">
         <button type="button" onClick={props.onClick}>
            Like me
         </button>
         <p>Click above to like this post</p>
      </div>
   );
};

export const GetUnlikeButton = (props) => {
   return (
      <div className="like-wrapper">
         <button type="button" onClick={props.onClick}>
            Unlike me
         </button>
         <p>You Liked this post!</p>
      </div>
   );
};