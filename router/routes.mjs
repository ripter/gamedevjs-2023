import { pageStory } from '../pages/story.mjs';

// Define your application routes with named placeholders
export const ROUTES = [
  { path: '/', page: pageStory },
  { path: '/story/:storyID', page: pageStory },
  // { path: '/user/:userID/', page: UserComponent },
  // { path: '/user/:userID/edit', page: UserEditComponent },
  // { path: '/post/:postID', page: PostComponent }
];