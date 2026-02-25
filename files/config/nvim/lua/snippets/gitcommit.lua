local ls = require('luasnip')
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local r = ls.restore_node

local fmt = require('luasnip.extras.fmt').fmt

-- Based on conventional-commit and gitmoji
-- https://github.com/conventional-changelog/commitlint/tree/master/%40commitlint/config-conventional
-- https://gitmoji.dev
local all_emojis = {
    build    = {
        'Changes that affect the build system or external dependencies',
        { icon = '🔧', name = 'wrench', default_title = 'Add or update configuration files' },
        { icon = '📦️', name = 'package', default_title = 'Add or update compiled files or packages' },
    },
    chore    = {
        'Chores',
        { icon = '🔖', name = 'bookmark', default_title = 'Release / Version tags' },
        { icon = '🚀', name = 'rocket', default_title = 'Deploy stuff' },
        { icon = '⬆️', name = 'arrow_up', default_title = 'Upgrade dependencies' },
        { icon = '⬇️', name = 'arrow_down', default_title = 'Downgrade dependencies' },
        { icon = '📌', name = 'pushpin', default_title = 'Pin dependencies to specific versions' },
        { icon = '🙈', name = 'see_no_evil', default_title = 'Add or update a .gitignore file' },
        { icon = '🧑‍💻', name = 'technologist', default_title = 'Improve developer experience' },
    },
    ci       = {
        'Changes to our CI configuration files and script',
        { icon = '💚', name = 'green_heart', default_title = 'Fix CI Build' },
        { icon = '👷', name = 'construction_worker', default_title = 'Add or update CI build system' },
    },
    docs     = {
        'Documentation only changes',
        { icon = '📝', name = 'memo', default_title = 'Add or update documentation' },
        { icon = '📄', name = 'page_facing_up', default_title = 'Add or update license' },
    },
    feat     = {
        'A new feature',
        { icon = '✨', name = 'sparkles', default_title = 'Introduce new features' },
        { icon = '💄', name = 'lipstick', default_title = 'Add or update the UI and style files' },
        { icon = '🍱', name = 'bento', default_title = 'Add or update assets' },
    },
    fix      = {
        'A bug fix',
        { icon = '🐛', name = 'bug', default_title = 'Fix a bug' },
        { icon = '🚑️', name = 'ambulance', default_title = 'Critical hotfix' },
        { icon = '🔒️', name = 'lock', default_title = 'Fix security or privacy issues' },
        { icon = '🚨', name = 'rotating_light', default_title = 'Fix compiler / linter warnings' },
        { icon = '✏️', name = 'pencil2', default_title = 'Fix typos' },
        { icon = '🥅', name = 'goal_net', default_title = 'Catch errors' },
        { icon = '🩹', name = 'adhesive_bandage', default_title = 'Simple fix for a non-critical issue' },
    },
    style    = {
        'Changes that do not affect the meaning of the code',
        { icon = '🎨', name = 'art', default_title = 'Improve structure / format of the code' },
        { icon = '🚚', name = 'truck', default_title = 'Move or rename resources (e.g.: files, paths, routes)' },
        { icon = '💡', name = 'bulb', default_title = 'Add or update comments in source code' },
    },
    refactor = {
        'A code change that neither fixes a bug nor adds a feature',
        { icon = '🔥', name = 'fire', default_title = 'Remove code or files' },
        { icon = '♻️', name = 'recycle', default_title = 'Refactor code' },
        { icon = '🏗️', name = 'building_construction', default_title = 'Make architectural changes' },
        { icon = '🗑️', name = 'wastebasket', default_title = 'Deprecate code that needs to be cleaned up' },
        { icon = '⚰️', name = 'coffin', default_title = 'Remove dead code' },
    },
    revert   = {
        'Revert changes',
        { icon = '⏪️', name = 'rewind', default_title = 'Revert changes' },
    },
    perf     = {
        'A code change that improves performance',
        { icon = '⚡️', name = 'zap', default_title = 'Improve performance' },
    },
    test     = {
        'Adding missing tests or correcting existing tests',
        { icon = '✅', name = 'white_check_mark', default_title = 'Add, update, or pass tests' },
    },
    misc     = {
        'Miscellaneous',
        { icon = '🚧', name = 'construction', default_title = 'Work in progress' },
        { icon = '🔀', name = 'twisted_rightwards_arrows', default_title = 'Merge branches' },
    },
}

local snippets = {
    s({
        trig = 'init',
        desc = 'Begin a project',
    }, c(1, {
        fmt('🎉 {}', i(1, 'initial commit')),
        fmt(':tada: {}', i(1, 'initial commit')),
        i(1, 'initial commit'),
    })),
}
for commit_type, emojis in pairs(all_emojis) do
    local desc_nodes = {}
    local snip_desc = nil
    for _, content in ipairs(emojis) do
        if type(content) == 'string' then
            snip_desc = content
        elseif type(content) == 'table' then
            table.insert(desc_nodes, sn(nil, {
                i(1), -- to hold cursor outside from the choiceNode
                c(2, {
                    sn(nil, { t(('%s '):format(content.icon)), i(1, content.default_title or 'title') }),
                    sn(nil, { t((':%s: '):format(content.name)), i(1, content.default_title or 'title') }),
                    i(1, content.default_title or 'title')
                }, { restore_cursor = true }),
            }))
        end
    end
    table.insert(snippets, s(
        {
            trig = commit_type,
            desc = ('Conventional commit (type: %s)\n%s'):format(commit_type, snip_desc or ''),
        },
        {
            c(1, {
                fmt(('%s{}: {}'):format(commit_type), {
                    i(1), -- to hold cursor outside from the choiceNode
                    r(2, 'description'),
                }),
                fmt(('%s({}): {}'):format(commit_type), {
                    i(1, 'scope'),
                    r(2, 'description'),
                }),
                fmt(('%s{}!: {}{}{}'):format(commit_type), {
                    i(1), -- to hold cursor outside from the choiceNode
                    r(2, 'description'),
                    t { '', 'BREAKING CHANGE: ' },
                    i(3, 'breaking change'),
                }),
                fmt(('%s({})!: {}{}{}'):format(commit_type), {
                    i(1, 'scope'),
                    r(2, 'description'),
                    t { '', 'BREAKING CHANGE: ' },
                    i(3, 'breaking change'),
                }),
            })
        },
        {
            stored = {
                ['description'] = #desc_nodes > 0 and c(1, desc_nodes) or i(1, 'title'),
            }
        }
    ))
end

return snippets
