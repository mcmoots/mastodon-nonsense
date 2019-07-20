/* Count how often each custom emoji has been used */

SELECT
    codes.shortcode
    , count(distinct statii.id) 
FROM (
    SELECT shortcode 
    FROM custom_emojis 
    WHERE 
        visible_in_picker=True
        and disabled=False
    ) as codes
LEFT JOIN (
    SELECT id, text from statuses
    WHERE
        local=True
        and created_at > '2019-07-17'
    ) as statii
ON
    statii.text similar to codes.shortcode
GROUP BY
    codes.shortcode
;


