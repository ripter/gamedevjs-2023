import { html } from '../libs/uhtml/index.mjs';

/**
 * Basic Message Component.
 * @param {Object} props - The properties object.
 * @param {string} props.text - The message text.
 * @param {string} [props.avatarURL] - The URL of the avatar image. Optional.
 * @param {string} props.className - space seprated string of CSS class names.
*/
export function MessageBasic(props) {
    const { text, avatarURL, className } = props;

    return html.for(props)`<div class=${`message message-basic ${className}`}>
        ${avatarURL ? html`<img class="message-avatar" src="${avatarURL}" alt="Avatar">` : ''}
        <p class="message-body">${text}</p>
    </div>`;
}
