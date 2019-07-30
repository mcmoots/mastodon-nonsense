/* Count how often each custom emoji has been used */

SELECT
    codes.shortcode
    , count(distinct statii.id) 
FROM (
    SELECT shortcode
    FROM custom_emojis
    WHERE domain is null
) as codes
LEFT JOIN (
    SELECT id, text from statuses
    WHERE
        local=True
        and text like '%:%:%'
    ) as statii
ON
    statii.text like '%:' || codes.shortcode || ':%'
GROUP BY
    codes.shortcode
;


