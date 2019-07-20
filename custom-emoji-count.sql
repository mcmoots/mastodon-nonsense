/* Count how often each custom emoji has been used */

SELECT
    codes.shortcode
    , count(distinct statii.id) 
FROM custom_emojis as codes
LEFT JOIN (
    SELECT id, text from statuses
    WHERE
        local=True
        and updated_at > '2019-07-17'
    ) as statii
ON
    statii.text like '%:' || codes.shortcode || ':%'
WHERE
    codes.visible_in_picker=True
    and codes.disabled=False
    -- these are the ones we have copied to our server  
    and codes.domain is null
GROUP BY
    codes.shortcode
;


