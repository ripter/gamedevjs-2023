import { html } from '../libs/uhtml/index.mjs';

/**
 * Basic Message Component.
 * @param {Object} props - The properties object.
 * @param {string} props.text - The message text.
 * @param {string} [props.avatarURL] - The URL of the avatar image. Optional.
*/
export function MessageBasic(props) {
    const { text, avatarURL } = props;

    return html`<div class="message message-basic">
        ${avatarURL ? html`<img class="message-avatar" src="${avatarURL}" alt="Avatar">` : ''}
        <div class="message-body">
            <p>${text}</p>
        </div>
    </div>`;
}
